-- 2002년에 만들어진 영화 가져오기
-- Movie.objects.filter(year=2002)
SELECT * FROM movies_movie
WHERE year = 2002;

-- 1970년에서 1980년 사이에 만들어진 영화 가져오기
-- Movie.objects.filter(year__range=[1970,1980])
SELECT * FROM movies_movie
WHERE year BETWEEN 1970 AND 1980;



-- e.으로 끝나는 영화 가져오기
-- Movie.objects.filter(title__endswith = 'e.')
SELECT * FROM movies_movie
WHERE title LIKE '%e.';

-- p로 시작하는 영화 가져오기
-- Movie.objects.filter(title__startswith = 'the')
SELECT * FROM movies_movie
WHERE title LIKE 'the%';



-- not을 포함하는 영화 가져오기
-- Movie.objects.filter(title__contains = 'not')
SELECT * FROM movies_movie
WHERE title LIKE '%not%';


-- 어떤 문자 포함할때: WHERE LIKE, endswith/contains/startswith
-- 범위로 가져올때: BETWEEN , range = []


-- 1번 영화의 점수 평균
SELECT AVG(value) FROM movies_score
WHERE movie_id=1;

SELECT DISTINCT country FROM movies_user;
SELECT count(DISTINCT age) FROM movies_actor;
SELECT Max(age) FROM movies_actor;
SELECT count(DISTINCT value) FROM movies_score;



-- 20세 이하 배우
-- Actor.objects.filter(age__lt='20')
SELECT * FROM movies_actor
WHERE age < 20;

-- 20세 이상이고 25세 이하인 배우
-- Actor.objects.filter(age__gte=20 , age__lt=30)
SELECT * FROM movies_actor
WHERE age >= 20 AND age <= 30;

-- 20세 이하이거나 60세 이상인 배우
SELECT * FROM movies_actor
WHERE age <= 20 OR age >= 45;

SELECT name, MAX(age) FROM movies_actor;

SELECT AVG(value) FROM movies_score
WHERE movie_id = 9;

SELECT * FROM movies_movie
WHERE year BETWEEN 2002 AND 2005;
SELECT * FROM movies_movie
WHERE year IN (2000, 2002, 2005);