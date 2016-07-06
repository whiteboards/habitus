import Ember from 'ember';
import marked from 'npm:marked'
export default Ember.Route.extend({
  content: Ember.computed('model.{content}', function () {
    if (this.get('model.content') === undefined) {return ''}
    return marked(this.get('model.content'))
  }), 
});
