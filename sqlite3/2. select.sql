
-- Movie.objects.all()
SELECT * FROM movies_movie; --moview_movie의 *(모든 필드)를 가져온다

-- User.objects.all()
SELECT * FROM movies_user; 

-- Movie.objects.all().order_by('year')
SELECT * FROM movies_movie
ORDER BY year;

-- Movie.objects.all().order_by('-year')
SELECT * FROM movies_movie
ORDER BY year DESC;






-- 숫자값 이용하기

-- User.objects.filter(age=31)
SELECT * From movies_user
WHERE age = 31;

-- User.objects.filter(age__lt = 20) __lt: less than 
SELECT * From movies_user
WHERE age < 20;

-- 20대인 사람 출력하기
-- gte : greater than equal
-- User.objects.filter(age__gte=20, age__lt=30)
SELECT * FROM movies_user
WHERE age >= 20 AND age < 30;

-- 2000년보다 이전 혹은 2010년 이후
-- Q 함수: or를 사용할때
-- Movie.objects.filter(Q(year__lt=2000) | Q(year__gt=2010))
SELECT * FROM movies_movie
WHERE year < 2000 or year > 2010;

-- 최댓값 호출
-- Movie.objects.aggregate(Max('year'))
SELECT title, MAX(year) FROM movies_movie; -- title과 year 컬럼만 가져옴

-- 평균값 계산
-- User.objects.aggregate(Avg('age'))
SELECT AVG(age) FROM movies_user;

-- 1번 영화의 최대 평점, 평균 평점
-- Score.objects.filter(movie_id=1).aggregate(Max('value'), Avg('value'))
SELECT MAX(value), AVG(value) FROM movies_score
WHERE movie_id=1;

-- 1번 유저가 몇개의 평가를 남겼는지
-- len(Score.objects.filter(user_id=1))
-- Score.objects.filter(user_id=1).count()
SELECT COUNT(*) FROM movies_score
WHERE user_id=1;
-- BETWEEN : 나이 범위 지정하기
-- User.objects.filter(age__range=[20,29])
SELECT * FROM movies_user
WHERE age BETWEEN 20 AND 29;

-- Movie.objects.filter(year__in=[2000,2005,2010])
SELECT * FROM movies_movie
WHERE year IN (2000,2005,2010);


-- 문자값 이용하기
-- Movie.objects.filter(title__contains ='the')
-- the를 포함하는 제목
SELECT * FROM movies_movie
WHERE title LIKE '%the%';

-- Movie.objects.filter(title__startswith ='the')
-- the로 시작하는 제목
SELECT * FROM movies_movie
WHERE title LIKE 'the%';

-- Movie.objects.filter(title__endswith='on.')
-- on.으로 끝나는 제목
SELECT * FROM movies_movie
WHERE title LIKE '%on.';

-- ORM에서 사용하려면 정규표현식을 사용해야합니다
-- g로 시작하고 d로 끝나는 4글자를 포함하는 제목
SELECT * FROM movies_movie
WHERE title LIKE '%g__d%';

-- 중복 제거하기
-- User.objects.values('country').distinct()
SELECT COUNT(DISTINCT country) FROM movies_user;

