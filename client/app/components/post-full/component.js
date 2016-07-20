import Ember from 'ember';

export default Ember.Component.extend({
  createdAt: Ember.computed('post.{insertedAt}', function () {
    if (!this.get('post.insertedAt')) { return '' }
    let myDate = this.get('post.insertedAt')
    return myDate.toDateString()
  })
});
