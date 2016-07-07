import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    viewPage(alias) {
      console.log('page', alias)
      this.transitionTo('page', alias);
    },
    editPage(alias) {
      this.transitionTo('admin.pages.edit', alias);
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
