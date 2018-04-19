from bottle import *
from datetime import *
import os, pymysql, locale, sys

locale.setlocale(locale.LC_ALL,"IS")
conn = pymysql.connect(host='tsuts.tskoli.is', port=3306, user='1501002670', passwd='mypassword', db='1501002670_vefforritun')
try:
    @route('/')
    def index():
        return template('./v8/index')

    @get('/listi')
    def listi():
        with conn.cursor() as cur:
            cur.execute("SELECT * FROM bilar")
        if cur.rowcount == 0:
            return template('./v8/info',info="Engin ökutæki")
        else:
            return template('./v8/listi',okutaeki=list(cur))

    @get('/meira/<numer>')
    def meira(numer):
        with conn.cursor() as cur:
            sql = "SELECT * FROM bilar WHERE skraningarnumer = %s"
            cur.execute(sql,numer)
        if cur.rowcount == 0:
            return template('./v8/info',info="Skráningarnúmer fannst ekki")
        else:
            numer = list(cur)[0]
            skraDags = numer[3].strftime('%e. %B %Y')
            skodunDags = numer[6].strftime('%e. %B %Y')
            return template('./v8/leita',bill=numer,skraDags=skraDags,skodunDags=skodunDags)

    @post('/leita')
    def leita():
        numer = request.forms.get('skraningarnumer')
        with conn.cursor() as cur:
            sql = "SELECT * FROM bilar WHERE skraningarnumer = %s"
            cur.execute(sql,numer)
        if cur.rowcount == 0:
            return template('./v8/info',info="Skráningarnúmer fannst ekki")
        else:
            numer = list(cur)[0]
            skraDags = numer[3].strftime('%e. %B %Y')
            skodunDags = numer[6].strftime('%e. %B %Y')
            return template('./v8/leita',bill=numer,skraDags=skraDags,skodunDags=skodunDags)

    @route('/baetavid')
    def baetavid():
        return template('./v8/baetavid')

    @post('/baetavid')
    def baetavid():
        numer = request.forms.get('skraningarnumer')
        tegund = request.forms.get('tegund')
        verknumer = request.forms.get('verksmidjunumer')
        skradagur = request.forms.get('skraningardagur')
        co2 = request.forms.get('co2')
        þyngd = request.forms.get('þyngd')
        skodun = request.forms.get('skodun')
        stada = request.forms.get('stada')
        try:
            cur = conn.cursor()
            sql = "INSERT INTO bilar VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
            cur.execute(sql,(numer,tegund,verknumer,skradagur,int(co2),int(þyngd),skodun,stada))
            conn.commit()
        except pymysql.err.IntegrityError:
            return template('./v8/infoadd',info="Ökutæki nú þegar til")
        finally:
            cur.close()
        return template('./v8/info',info="Ökutæki hefur verið bætt við")

    @post('/breyta')
    def breyta():
        numer = request.forms.get('skraningarnumer')
        with conn.cursor() as cur:
            sql = "SELECT * FROM bilar WHERE skraningarnumer = %s"
            cur.execute(sql,numer)
        if cur.rowcount == 0:
            return template('./v8/info',info="Skráningarnúmer fannst ekki")
        else:
            numer = list(cur)[0]
            return template('./v8/breyta',bill=numer)

    @post('/uppfaera')
    def uppfaera():
        skranum = request.forms.get('skranum')
        numer = request.forms.get('skraningarnumer')
        tegund = request.forms.get('tegund')
        verknumer = request.forms.get('verksmidjunumer')
        skradagur = request.forms.get('skraningardagur')
        co2 = request.forms.get('co2')
        þyngd = request.forms.get('þyngd')
        skodun = request.forms.get('skodun')
        stada = request.forms.get('stada')
        try:
            cur = conn.cursor()
            sql = "UPDATE bilar SET skraningarnumer=%s, Tegund=%s, verksmidjunumer=%s, skraningardagur=%s, co2=%s, þyngd=%s, skodun=%s, stada=%s WHERE skraningarnumer=%s"
            cur.execute(sql,(numer,tegund,verknumer,skradagur,int(co2),int(þyngd),skodun,stada,skranum))
            conn.commit()
        except pymysql.err.IntegrityError:
            return template('./v8/info',info="Ökutæki nú þegar til")
        finally:
            cur.close()
        return template('./v8/info',info="Ökutæki hefur verið uppfært")

    @post('/eyda')
    def eyda():
        numer = request.forms.get('skraningarnumer')
        with conn.cursor() as cur:
            sql = "SELECT * FROM bilar WHERE skraningarnumer = %s"
            cur.execute(sql,numer)
        if cur.rowcount == 0:
            return template('./v8/info',info="Skráningarnúmer fannst ekki")
        else:
            numer = list(cur)[0][0]
            with conn.cursor() as cur:
                sql = "DELETE FROM bilar WHERE skraningarnumer = %s"
                cur.execute(sql,numer)
                conn.commit()
            return template('./v8/info',info="Ökutæki hefur verið eytt")

    @route('/css/<skjal>')
    def server_static(skjal):
        return static_file(skjal, root='./v8/css')

    @error(404)
    def villa404(error):
        return template('./v8/info',info="Villa 404 Síða fannst ekki")

    @error(500)
    def villa500(error):
        return template('./v8/info',info="Villa 500 Villa í forriti")

    run(host="0.0.0.0", port=os.environ.get('PORT'))
    #run(host='localhost', port=8080, debug=True, reloader=True)
finally:
    conn.close()
