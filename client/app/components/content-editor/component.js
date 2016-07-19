import Ember from 'ember';
import marked from 'npm:marked'

export default Ember.Component.extend({
  commentOptions: ['true', 'false'],
  commentsEnabled: '',
  authManager: Ember.inject.service('session'),
  previewContent: Ember.computed('model.{content}', function () {
    if (this.get('model.content') === undefined) {return ''}
    return marked(this.get('model.content'))
  }), 
  alias: Ember.computed('model.{title}', {
    get(key) {
      if (this.get('model.title') === undefined) {return ''}
      return `${this.get('model.title')}`.replace(/[^a-zA-Z0-9-_]/g, '-').toLowerCase();
    },
    set(key, value) {
      var title = value.replace(/[^a-zA-Z0-9-_]/g, '-').replace(/-{2,}/g, '').toLowerCase();
      this.set('alias', title)
      return title;
    }
  }),
  actions: {
    savePage(model) {
      // trigger action on parent component
      let comments = this.get('commentsEnabled')
      console.log('setting comments to be:', comments)
      if (comments === '') {
        comments = 'true'
      }
      model.set('enableComments', comments)
      model.set('alias', this.get('alias'))
      model.set('user', this.get('authManager').get('currentUser'))
      this.sendAction('savePage', model);
    },
  }
});
