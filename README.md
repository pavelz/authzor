# Authzor

Session and User API only controller, but had to graft cookies in for Sessions via middlewares. 
Implemented univeral redis shim to somewhat emulate an ORM. 
Can be added to objects like Profile for example pretty easily, to be stored in redis.
All records are **encrypted** with Rails Message Encryption code. Must not loose that key in config directory or all users are lost.But PRIVACY.
User keys for user records in REDIS are SHA1 hashes of email addresses.

General request fromat is: request + {email: password:}. Login does not need that as it acts only on session cookie.

Routes implemented:
```
     Prefix Verb   URI Pattern             Controller#Action
   sessions POST   /sessions(.:format)     sessions#create
    session DELETE /sessions/:id(.:format) sessions#destroy
      users POST   /users(.:format)        users#create
       user PATCH  /users/:id(.:format)    users#update
            PUT    /users/:id(.:format)    users#update
```
Caveat: implemented email/password as flat queries. can update to deep hashes to be stored in redis.

Some test coverage
* rcov did not install on big sur, filed an issue, to see and update work on test coverage.
* needs more test coverage
