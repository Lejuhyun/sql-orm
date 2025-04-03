from django.db import models

# Create your models here.

class Actor(models.Model): # 영화배우에 대한 정보
    name = models.CharField(max_length=500)
    age = models.IntegerField()

class Movie(models.Model): # 영화에 대한 정보
    title = models.CharField(max_length=500)
    year = models.IntegerField()
    actors = models.ManyToManyField(Actor, related_name='movies') # 영화와 영화배우를 M:N으로 연결해준다(ManyToMany)

class Category(models.Model): 
    name = models.CharField(max_length=500)
    movies = models.ManyToManyField(Movie, related_name='categories')

class User(models.Model): # 평점을 남긴 사람
    name = models.CharField(max_length=500)
    country = models.CharField(max_length=500)
    email = models.CharField(max_length=500)
    age = models.IntegerField()

class Score(models.Model): # 댓글
    content = models.CharField(max_length=500)
    value = models.IntegerField()
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)