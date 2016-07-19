import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    editPage(alias) {
      this.transitionTo('admin.blog.edit', alias);
    },
    deletePage(post) {
      post.deleteRecord();
      console.log('isdeleted?', post.get('isDeleted'))
      post.save().then(()=> {
        console.log('we deleted!')
      })
    }
  }
});
