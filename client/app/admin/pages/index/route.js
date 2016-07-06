import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    viewPage(model) {
      this.transitionTo('page', model.id);
    },
    deletePage(page) {
      page.deleteRecord();
      console.log('isdeleted?', page.get('isDeleted'))
      page.save().then(()=> {
        console.log('we deleted!')
      })
    }
  }
});
