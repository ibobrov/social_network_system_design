// Sql бд, postgres
//
// Replication:
// - master-slave (async)
// - replication factor 2
//
// Sharding:
// - key based by post_id

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
  id uuid [pk, unique, not null, note: 'Идентификатор места']
  user_id uuid [pk, unique, not null, note: 'Автор поста']
  post_id uuid [not null, note: 'Идентификатор поста']
  reply_comment_id [note: 'Идентификатор комментария ответа']
  text varchar [not null, note: 'Текст комментария']
  created_at timestamp [not null, note: 'Время лайка']
}

Ref: posts.author_id > users.id
Ref: posts.place_id > places.id
Ref: likes.user_id > users.id
Ref: likes.post_id > posts.id
Ref: comments.user_id > users.id
Ref: comments.post_id > posts.id