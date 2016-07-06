import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import { belongsTo, hasMany } from 'ember-data/relationships';

export default Model.extend({
  title: attr('string'),
  content: attr('string'),
  user_id: belongsTo('user'),
  inserted_at: attr('date'),
  updated_at: attr('date'),
  comments: hasMany('comments'),
  tags: hasMany('tags'),
  alias: Ember.computed('title', function() {
    return `${this.get('title')}`.replace(/[^a-zA-Z0-9-_]/g, '-').toLowerCase();
  })
});
