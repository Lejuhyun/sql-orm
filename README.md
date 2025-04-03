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

# INSERT
```sql
INSERT INTO movies_movie (title, year)
VALUES ('darknight', 2008);
```




# 설치한 프로그램들
- django-extensions
- ipython

- mysqlclient
- faker 
- django

# 3. 이름으로 가져오기
- SQL 
```sql
SELECT * FROM movies_movie
WHERE title LIKE '%the'/'the%'/'%the%'
```
- Django ORM
```shell
Movie.objects.filter(title__endswith='the') 
Movie.objects.filter(title__startswith='the') 
Movie.objects.filter(title__contains='the') 
```

# 4. 이상 이하
- SQL
```sql
SELECT * FROM movies_actor
WHERE age <= 20;
```
- Django
```shell
Actor.objects.filter(age__lt = 20);
```
- lt(less than), gte(greater than equal)

# 5. AND / OR
- AND
    - 장고에서는 그냥 콤마사용
```sql
SELECT * FROM movies_actor
WHERE age >= 20 AND age <30;
```
```shell
Actor.objects.filter(age__gte=20, age__lt=30)
```
- ## OR : 장고에서는 Q 사용, | 로 연결
```sql
SELECT * FROM movies_actor
WHERE age <=20 OR age >= 45;
```
```shell
Actor.objects.filter(Q(age__lte=20)|Q(age__gte=45))
```

# 6. 최대, 최소, 평균 (count는 agg안해도 된다)
```sql
SELECT MAX(age), AVG(age) FROM movies_actor; 
```
```shell
Actor.objects.aggregate(Max('age'), Avg('age'))
```

- 조건 있을 때
```sql
SELECT AVG(value) FROM movies_score
WHERE movie_id = 9;
```
```shell
Score.objects.filter(movie_id=9).aggregate(Avg('value'))
```

# 7. 범위 지정하기
## 7-1. BETWEEN A AND B(__range=[])
```sql
SELECT * FROM movies_movie
WHERE year BETWEEN 2002 AND 2005;
```
```shell
Movie.objects.filter(year__range = [2002,2005])
```
## 7-2. IN(__in=[])
```sql
SELECT * FROM movies_movie
WHERE year IN (2000, 2002, 2005);
```
```shell
Movie.objects.filter(year_in = [2000, 2002, 2005])
```

# 8 . 중복 제거하기
```sql
SELECT DISTINCT country FROM movies_user;
```
```shell
User.objects.values('country').distinct()
```