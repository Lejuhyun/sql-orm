# Django에서 MySQL 쓰기~

## 1. model 생성하기

## 2. settings.py 바꾸기
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', # sqlite대신 mysql 프로그램을 사용할것
        'NAME': 'mydb',
        'HOST': 'localhost',
        'PORT': '3306',
        'USER': 'root', 
        'PASSWORD': 'password',
    }
}
```

```shell
pip install mysqlclient
python manage.py migrate
```

