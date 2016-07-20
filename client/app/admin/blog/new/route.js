import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.createRecord('post');
  },
  actions: {
    savePage(model) {
      console.log('saving model:', model)
      model.save().then(()=> {
        console.log('we saved!')
        this.transitionTo('admin.blog.index');
      })
    }
  }
});
