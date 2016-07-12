import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
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
