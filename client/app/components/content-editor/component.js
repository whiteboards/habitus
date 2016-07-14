import Ember from 'ember';
import marked from 'npm:marked'

export default Ember.Component.extend({
  commentOptions: ['true', 'false'],
  commentsEnabled: 'false',
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
    enableComments(value) {
      console.log('Should comments be enabled?:', value)
      let model = this.get('model')
      model.set('enableComments', value)
      this.set('commentsEnabled', value)
    },
    savePage(model) {
      // trigger action on parent component
      console.log('setting comments to be:', this.get('commentsEnabled'))
      model.set('enableComments', this.get('commentsEnabled'))
      model.set('alias', this.get('alias'))
      this.sendAction('savePage', model);
    },
  }
});
