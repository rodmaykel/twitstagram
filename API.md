### Mechanics

BASE_URL: http://example.com/api

### General Errors



### Endpoints

#### GET /groups

*Parameters*
  - query (optional)
  - category (optional)
  - page (optional, default=1)

*Response*
  - total
  - groups: array of GroupObject

*Errors*

#### GET /groups/:id

*Parameters*
  NONE

*Response*
  - GroupObject
  - subjects: array of SubjectObject (all)
  - tweets: array of TweetObject (first page)
  - photos: array of PhotoObject (first page)

*Errors*

#### GET /groups/:id/subjects

*Parameters*
  NONE

*Response*
  - total
  - subjects: array of SubjectObject

*Errors*

#### GET /groups/:id/tweets

*Parameters*
  - page (optional, default=1)

*Response*
  - total
  - tweets: array of TweetObject

*Errors*

#### GET /groups/:id/photos

*Parameters*
  - page (optional, default=1)

*Response*
  - total
  - photos: array of PhotoObject

*Errors*

### Objects

#### NOTE

* created_at and updated_at are system generated fields. For the Tweet or Photo time, look at the field created

#### GroupObject

```
{
  "id":1,
  "name":"Test group",
  "description":"This is the test group",
  "photo":"PHoto_me",
  "category":"test",
  "created_at":"2014-04-21T16:14:01.925Z",
  "updated_at":"2014-04-21T16:14:01.925Z"
}
```

#### SubjectObject

```
{
  "id":2,
  "group_id":1,
  "twitter":"annecurtissmith",
  "instagram":"3585673",
  "name":"Anne Curtis",
  "photo":"fdsasfasd",
  "created_at":"2014-04-21T16:15:56.355Z",
  "updated_at":"2014-05-05T16:48:34.342Z"
}
```

#### TweetObject

```
{
  "id":140,
  "subject_id":2,
  "text":"Goodnight everyone! Early calltime for Dyesebel tomorrow. May paa na ako. Tatapak na ako sa mundo ng mga tao. Goodnightyyyyyy!",
  "created":"2014-05-04T16:42:35.000Z",
  "photo":null,
  "tweet_id":"462995714637692928",
  "created_at":"2014-05-04T18:21:19.289Z",
  "updated_at":"2014-05-04T18:21:19.289Z"
}
```

#### PhotoObject

```
{
  "id":81,
  "subject_id":2,
  "caption":"You were remembered all over the world today. Happy 85th birthday My favorite leading lady and actress of  all time, Audrey Hepburn. Goodnight everyone. 💋",
  "created":"2014-05-04T16:22:35.000Z",
  "photo":"http://distilleryimage4.s3.amazonaws.com/1d9ccbbed3a811e39b5e0002c9da9c38_8.jpg",
  "instagram_id":"713036161178307423_3585673",
  "created_at":"2014-05-04T18:21:22.253Z",
  "updated_at":"2014-05-04T18:21:22.253Z"
}
```
