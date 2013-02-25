<?php

namespace TrainingWheels\Common;
use TrainingWheels\Store\DataStore;
use TrainingWheels\Log\Log;
use Exception;

abstract class CachedObject {

  private $id;
  private $properties;

  // Reference to the data store.
  protected $data;

  /**
   * Constructor.
   */
  public function __construct(DataStore $data) {
    $this->data = $data;
    $this->properties = array();
  }

  /**
   * Destructor. Save this object to the cache if the ID has been set.
   */
  public function __destruct() {
    if ($this->id) {
      $this->cacheSave();
    }
    else {
      Log::log('Unsaved cache object', L_WARNING, 'actions', array('layer' => 'app', 'source' => 'CachedObject', 'params' => "id=$this->id"));
    }
  }

  /**
   * Build this object. This should be called from the child class' constructor,
   * after registering the required properties.
   */
  protected function cacheBuild($id) {
    if (empty($id)) {
      throw new Exception("Cannot build cache object without a provided ID.");
    }
    $this->id = $id;
    $this->cacheFetch();
  }

  /**
   * Add cached properties.
   */
  protected function cachePropertiesAdd($properties) {
    $this->properties = array_merge($this->properties, $properties);
  }

  /**
   * Save the current object back to the cache.
   */
  private function cacheSave() {
    $cache_entry = array(
      'id' => $this->id,
      'data' => array(),
    );

    foreach ($this->properties as $prop) {
      $cache_entry['data'][$prop] = $this->$prop;
    }

    $this->data->remove('cache', array('id' => $this->id));
    $this->data->insert('cache', $cache_entry, FALSE);

    Log::log('Cache save', L_DEBUG, 'actions', array('layer' => 'app', 'source' => 'CachedObject', 'params' => "id=$this->id"));
  }

  /**
   * Load properties from the cache and apply them to this object.
   */
  private function cacheFetch() {
    $cache_entry = $this->data->find('cache', array('id' => $this->id));
    if ($cache_entry) {
      $found_props = array();
      foreach ($this->properties as $prop) {
        if (isset($cache_entry['data'][$prop]) && !empty($cache_entry['data'][$prop])) {
          $this->$prop = $cache_entry['data'][$prop];
          $found_props[$prop] = $cache_entry['data'][$prop];
        }
      }

      $params = "id=$this->id " . json_encode($found_props);
      Log::log('Cache hit', L_DEBUG, 'actions', array('layer' => 'app', 'source' => 'CachedObject', 'params' => $params));
    }
    else {
      Log::log('Cache miss', L_DEBUG, 'actions', array('layer' => 'app', 'source' => 'CachedObject', 'params' => "id=$this->id"));
    }
  }
}
