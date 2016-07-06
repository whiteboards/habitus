import Ember from 'ember';
import marked from 'npm:marked'

export default Ember.Component.extend({
  previewContent: Ember.computed('model.{content}', function () {
    if (this.get('model.content') === undefined) {return ''}
    return marked(this.get('model.content'))
  }), 
  alias:Ember.computed('model.{alias}', function () {
    if (this.get('model.alias') === 'undefined') {return ''}
    return this.get('model.alias')
  }), 
  actions: {
    savePage(model) {
      // trigger action on parent component
      this.sendAction('savePage', model);
    },
  }
});
