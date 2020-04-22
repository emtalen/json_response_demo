# frozen_string_literal: true

RSpec.describe 'POST /api/comments', type: :request do
  
  describe 'with valid credentials' do
    let!(:user) { create(:user) }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end

    let!(:article) { create(:article) }

    describe 'User can comment article' do
      before do
        post '/api/comments',
          params: {
            comment: {
              body: 'I love this article',
              article_id: article.id,
              user_id: user.id
            }
          },
          headers: user_headers
      end

      it 'returns a 200 response' do
        expect(response).to have_http_status 200
      end

      it 'returns success message' do
        expect(response_json['message']).to eq 'Your comment has been posted'
      end

      it 'assign comment to correct article' do
        comment = Comment.last
        expect(comment.article).to eq article
      end
    end

    describe 'User cannot post empty comment' do
      before do
        post '/api/comments',
          params: {
            comment: {
              body: '',
              article_id: article.id,
              user_id: user.id
            }
          },
          headers: user_headers
      end

      it 'returns a 400 response' do
        expect(response).to have_http_status 400
      end

      it 'returns error message' do
        expect(response_json['message']).to eq 'You cannot post an empty comment'
      end
    end

    describe 'User cannot post comment without article id' do
      before do
        post '/api/comments',
          params: {
            comment: {
              body: 'I love this artice',
              article_id: nil,
              user_id: user.id
            }
          },
          headers: user_headers
      end

      it 'returns a 400 response' do
        expect(response).to have_http_status 400
      end

      it 'returns error message' do
        expect(response_json['message']).to eq 'Whoops, it seems like we have an internal issue'
      end
    end
  end

  describe 'without valid credentials' do
    let!(:article) { create(:article) }
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }
    before do
      post '/api/comments',
        params: {
          comment: {
            body: 'I love this artice',
            article_id: article.id
          }
        },
        headers: headers
    end

    it 'returns 401 status' do
      expect(response).to have_http_status 401
    end

    it 'returns error message' do
      expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
    end
  end
end
