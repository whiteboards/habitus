import Ember from 'ember';

export default Ember.Component.extend({
  comment: '',
  authManager: Ember.inject.service('session'),
  actions: {
    saveComment() {
      console.log('saving comment:', this.get('comment'))
      console.log('user session', this.get('authManager').get('currentUser'))
      let pageId = this.get('page').get('id')
      let page = this.get('store').peekRecord('page', pageId)
      console.log('page', page)
      let commentModel = this.get('store').createRecord('comment');
      commentModel.set('content', this.get('comment'))
      commentModel.set('page', page)
      commentModel.set('user', this.get('authManager').get('currentUser'))
      commentModel.save().then(()=> {
        console.log('we saved!')
      })
    }
  }
});