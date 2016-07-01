import Ember from 'ember';
import marked from 'npm:marked'

export default Ember.Component.extend({
  content: '',
  title: '',
  previewContent: Ember.computed('content', function () {
    return marked(this.get('content'))
  }), 
  alias: Ember.computed('title', function () {
    return this.get('title').replace(/[^a-zA-Z0-9-_]/g, '-').toLowerCase()
  }),
  actions: {
    savePage() {
      // trigger action on parent component
      this.sendAction('savePage', true);
    },
  } 
});
