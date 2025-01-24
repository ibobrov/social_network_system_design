// Sql бд, postgres
//
// Replication:
// - master-slave (async)
// - replication factor 2
//
// Sharding:
// - key based by user_id

Table users {
  id uuid [pk, unique, not null, note: 'Идентификатор пользователя']
  name varchar [not null, note: 'Имя, логин']
  img_link url [not null, note: 'Ссылка на аватарку']
}

Table followers {
  id uuid [pk, unique, not null, note: 'Идентификатор места']
  user_id uuid [not null, note: 'Идентификатор места']
  follower_id uuid [not null, note: 'Идентификатор места']
}