-- ORM에서 제목 수정하는 방법
-- movie = Movie.objects.get(id=1)
-- movie.title = 'spiderman'
-- movie.save()
SELECT * FROM movies_movie
WHERE id=1;

UPDATE movies_movie -- 업데이트할 테이블 선택
SET title = 'iron man' -- 값 입력
WHERE id=1;
