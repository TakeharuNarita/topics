# RealWorldのAPI仕様

1. **認証(Authentication):**
   * `POST /api/users/login`
   * `POST /api/users`
   
2. **ユーザー情報(User):**
   * `GET /api/user`
   * `PUT /api/user`
   
3. **プロファイル(Profile):**
   * `GET /api/profiles/:username`
   * `POST /api/profiles/:username/follow`
   * `DELETE /api/profiles/:username/follow`
   
4. **記事(Articles):**
   * `GET /api/articles`
   * `GET /api/articles/feed`
   * `GET /api/articles/:slug`
   * `POST /api/articles`
   * `PUT /api/articles/:slug`
   * `DELETE /api/articles/:slug`
   
5. **コメント(Comments):**
   * `POST /api/articles/:slug/comments`
   * `GET /api/articles/:slug/comments`
   * `DELETE /api/articles/:slug/comments/:id`
   
6. **お気に入り(Favorites):**
   * `POST /api/articles/:slug/favorite`
   * `DELETE /api/articles/:slug/favorite`
   
7. **タグ(Tags):**
   * `GET /api/tags`
