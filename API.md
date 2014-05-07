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
  - subjects: array of SubjectObject (first page)
  - tweets: array of TweetObject (first page)
  - photos: array of PhotoObject (first page)

*Errors*

#### GET /groups/:id/subjects

*Parameters*
  - page (optional, default=1)

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

#### GroupObject

```
{

}
```

#### SubjectObject

```
{
  
}
```

#### TweetObject

```
{
  
}
```

#### PhotoObject

```
{
  
}
```