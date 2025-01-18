// Sql бд, вроде postgres

Table users {
  id uuid [pk, unique, not null, note: 'Идентификатор пользователя']
  name varchar [not null, note: 'Имя, логин']
  img_link url [not null, note: 'Ссылка на аватарку']
}

Table posts {
  id uuid [pk, unique, not null, note: 'Идентификатор поста']
  author_id uuid [not null, note: 'Автор поста']
  text varchar [not null, note: 'Текст поста']
  imgs url[] [not null, note: 'Ссылки на загруженные изображения']
  place_id uuid [not null, note: 'Идентификатор места']
}

Table likes {
  user_id uuid [not null, note: 'Автор поста']
  post_id uuid [not null, note: 'Идентификатор поста']
  created_at timestamp [not null, note: 'Время лайка']
}

Table comments {
  user_id uuid [pk, unique, not null, note: 'Автор поста']
  post_id uuid [not null, note: 'Идентификатор поста']
  text varchar [not null, note: 'Текст комментария']
  created_at timestamp [not null, note: 'Время лайка']
}

Table places {
  id uuid [pk, unique, not null, note: 'Идентификатор места']
  title varchar [not null, note: 'Название места']
  country varchar [not null, note: 'Страна']
  category varchar[] [not null, note: 'Категории']
  ratting int [not null, note: 'Уровень популярности']
  description varchar [not null, note: 'Описание места']
}

Table followers {
  id uuid [pk, unique, not null, note: 'Идентификатор места']
  user_id uuid [not null, note: 'Идентификатор места']
  follower_id uuid [not null, note: 'Идентификатор места']
}

Ref: posts.author_id > users.id
Ref: posts.place_id > places.id
Ref: likes.user_id > users.id
Ref: likes.post_id > posts.id
Ref: comments.user_id > users.id
Ref: comments.post_id > posts.id