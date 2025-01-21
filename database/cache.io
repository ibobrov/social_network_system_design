// Key-value бд, например redis

Table aggregated_post_like {
  post_id uuid [not null, note: 'Идентификатор поста']
  count integer [not null, note: 'Кол-во лайков']
}

Table aggregated_post_comment {
  post_id uuid [not null, note: 'Идентификатор поста']
  count integer [not null, note: 'Кол-во комментариев']
}