import Ember from 'ember';

export default Ember.Component.extend({
  model() {
    return this.store.createRecord('comment');
  },
  actions: {
    saveComment(model) {
      this.sendAction('saveComment', model)
    }
  }
});