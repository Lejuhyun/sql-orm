-- 1번 유저가 작성한 모든 점수(scores)
-- user = User.objects.get(id=1)
-- user.score_set.all()
-- Score.objects.filter(user_id=1)

SELECT * 
FROM movies_user JOIN movies_score
ON movies_user.id = movies_score.user_id -- 어떤 데이터가 일치하는지
WHERE movies_user.id = 1;

-- 100번 영화가 어떤 카테고리인지
-- Movie.objedts.get(id=100).categories.all()

SELECT * 
FROM movies_movie JOIN movies_category_movies
ON movies_movie.id = movies_category_movies.movie_id
JOIN movies_category
ON movies_category_movies.category_id = movies_category.id
WHERE movies_movie.id = 100;

-- 드라마 카테고리에 속한 모든 영화 출력
-- Category.objects.get(name='drama').movies.all()
-- Category.objects.filter(name='drama')[0].movies.all()

SELECT * 
FROM movies_category JOIN movies_category_movies
ON movies_category.id = movies_category_movies.category_id
JOIN movies_movie
ON movies_category_movies.movie_id = movies_movie.id
WHERE movies_category.name = 'drama';

-- group by
-- User.objects.values('country').annotate(Count('id'))
SELECT country, COUNT(*) FROM movies_user
GROUP BY country;

-- 나라별 평균 점수
-- user 테이블과 score 테이블 합치기
SELECT country, AVG(value)
FROM movies_user JOIN movies_score
ON movies_user.id = movies_score.user_id
GROUP BY country;