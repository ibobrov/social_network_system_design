# Дизайн социальной сети для курса по System Design

#### Функциональные требования:

- список мест для путешествий
- публикация постов из путешествий с фотографиями, небольшим описанием и привязкой к конкретному месту путешествия;
- оценка (лайки) и комментарии постов других путешественников;
- подписка на других путешественников, чтобы следить за их активностью;
- поиск популярных мест для путешествий и просмотр постов с этих мест;
- просмотр ленты других путешественников и ленты пользователя, основанной на подписках в обратном хронологическом порядке;

#### Нефункциональные требования:

- Пользователей 10 000 000;
- для расчетов берём поведение пользователей следующее: каждый пользователь делает 3 поста в неделю,
  в день пишет 5 комментариев, лайкает 10 постов, просматривает ленту 2 раза (в среднем по 20 постов)
  и переходит по ссылке на пост 3 раза;
- только для СНГ аудитория;
- активность пользователь может возрастать в сезон отпусков и праздников;
- храним посты, подписки, реакции, комментарии бесконечно;
- ограничение на подписки у одного пользователя 10000, на посты не более 100 в сутки, максимум 10 фото в посте до 2 мб (сжатие на клиенте),
 описание в посте до 500 символов, на комментарии не более 10000 в сутки, на комментарий до 500 символов;
- максимальное latency публикация поста, комментария, лайка, поиска популярных мест, подписка на участника 1s;
- максимальное latency получения ленты 2s;
- доступность 99,95%.

#### Базовые расчеты

RPS
```
DAU ~= 10 000 000
RPS публикации постов = 10 000 000 / 86 400 / 7 * 3 ~= 50
RPS комментариев = 10 000 000 / 86 400 / * 5 ~= 580
RPS реакций = 10 000 000 / 86 400 / * 10 ~= 1160
RPS просмотр ленты батчем = 10 000 000 / 86 400 / * 2 ~= 230
RPS просмотр поста = 10 000 000 / 86 400 / * 3 ~= 350
```

Трафик
```
Post:
- author_id
- location_id
- created_at
- title
- photos (среднее 5 фото по 1Mb = 5Mb)

Comment:
- author_id
- post_id
- text
- create_at

Like:
- author_id
- post_id
- create_at

В среднем 1 пост ~= 5Mb
В среднем 1 комментарий ~= 150B
В среднем 1 лайк ~= 20B

Трафик публикации постов = 50 * 5MB ~= 250Mb
Трафик комментариев = 580 * 150B ~= 87Kb
Трафик реакций = 580 * 20B ~= 12Kb
Трафик просмотр ленты батчем = 230 * 20 * 5Mb ~= 23Gb
Трафик просмотр поста = 350 * 5Mb ~= 2Gb
```