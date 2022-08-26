<samp>

# [TCMS-CRDB DRF Course](https://pypi.org/project/heyoo/)

[![Made in Tanzania](https://img.shields.io/badge/made%20in-tanzania-008751.svg?style=flat-square)](https://github.com/Tanzania-Developers-Community/made-in-tanzania)

Django Session for [UDICTI TCMS-CRDB BootCamp 2022](https://udicti.udsm.ac.tz/)


## Session Coverage
[17 August 2022]
1. Installing Python & Django on MacOS and Windows. ✔️
2. Setting up Project's Virtual Environment. ✔️
3. First Phase Coding (Traditional Django). ✔️

[18 August 2022]

4. Second Phase Coding (DRF-RestFul APIs).
    - Installing and understanding the Django Rest Framework. ✔️
    - Implementing HTTP methods (GET POST DELETE & PUT) ✔️
    - Deploying the project on Heroku ✔️

### How To use the Source Code

```bash
$ git clone https://github.com/kalokola/tcms.git
$ cd tcms/
$ python3 -m venv enviroment-name
$ source enviroment-name/bin/ctivate [press-enter]
(enviroment-name)$ pip3 install -r requirements.txt
(enviroment-name)$ python3 manage.py runserver 8000
```

You can now visit the browser on your [localhost](http://127.0.0.1:8000) at port 8000, you can change 800 to your favourite port number


## Installing DRF into the project.
```bash

# Install DRF
$ pip3 install djangorestframework

# Check Version
$ python3 -m djangorestframework --version
```

## Deploying the project on Heroku
NOTE: Install **[git]()** and [heroku cli]()

[**Step 1]**: Install Whitenoise and in the settings.py of your project folder register Whitenoise as a thirdy party app also add the middleware class.

- Whitenoise allows our web app to serve its own static files, making it a self-contained unit that can be deployed anywhere without relying on nginx, Amazon S3 or any other external service

On Terminal
```bash
$ pip install whitenoise
# staticfiles will be created
$ python3 manage.py collectstatic
```

```bash
# register whitenoise
INSTALLED APPS [
    ...............
    'whitenoise.runserver_nostatic'
    ...............
]

# add the middleware class
MIDDLEWARES = [
    ..................
    'whitenoise.middleware.WhiteNoiseMiddleware',
    ..............................
]
```


[**Step 2**]: Create a [Procfile](https://devcenter.heroku.com/articles/procfile) Install [gunicorn](https://en.wikipedia.org/wiki/Gunicorn)
- Gunicorn is a python HTTP server for communication with wsgi applications. It allows you to run any Python application concurrently by running multiple Python processes within a single dyno.
- Procfile specifies the comand to be excuted when a dyno is starts up.

```bash
# install gunicorn
$ pip install gunicorn
```

```bash
$ touch Procfile && nano Procfile
    # add this line in the Procfile
    web: gunicorn engine.wsgi
```

[**Step 3**]: Add the runtime.txt, this holds the interpreter used when esigning the code.

```bash
# get python version
$ python3 --version
 3.8.10

$ touch runtime.txt && nano runtime.txt
# add this line
python-3.8.10
```

[**Step 4**]: Create a requrements.txt file.
- This holds all the necessary packages for your django app
```bash
    # activate environment
    (enviro)$ pip3 freeze > requiremnts.txt
```
[**Step 5**]: Finally pushing the code to Heroku

```bash
    $ git init
    $ git commit -m "Deploy to Heroku"
    $ heroku login
    $ heroku create tcms-apis
    $ git push --set-upstream heroku master
```

NB: When your app works correclty and you test all endpoints remember to turn DEBUG to 1 or True to secure your live application.

[**Step 6**]: Your app is finally deployed, you can access it at [tcms-apis]()

## All the credit

1. [kalokola](https://github.com/kalokola)
2. Our Trainers & Coachs.
3. TCMS CRDB Class 2022.
</samp>
