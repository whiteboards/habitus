import Ember from 'ember';
import marked from 'npm:marked'

export default Ember.Component.extend({
  content: '',
  title: '',
  previewContent: Ember.computed('content', function () {
    return marked(this.get('content'))
  }) 
});
