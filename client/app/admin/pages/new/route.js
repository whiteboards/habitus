import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    savePage() {
      let page = this.store.createRecord('page', {
        content: this.get('content'),
        title: this.get('title')
      })
      page.save().then(function (){
        this.transitionTo('admin.pages');
      })
    }
  }
});
