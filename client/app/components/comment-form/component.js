import Ember from 'ember';

export default Ember.Component.extend({
  comment: '',
  authManager: Ember.inject.service('session'),
  store: Ember.inject.service('store'),
  actions: {
    saveComment() {
      console.log('saving comment:', this.get('comment'))
      console.log('store:', this.get('store'))
      let modelId = this.get('model').get('id')
      let model = this.get('store').peekRecord(this.get('type'), modelId)
      console.log('model', model)
      let commentModel = this.get('store').createRecord('comment');
      commentModel.set('content', this.get('comment'))
      commentModel.set(this.get('type'), model)
      commentModel.set('user', this.get('authManager').get('currentUser'))
      commentModel.save().then(()=> {
        console.log('we saved!')
      })
    }
  }
});