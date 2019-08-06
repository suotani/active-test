<template>
  <div>
    <ul>
        <li v-for="test in list">
            <p>{{test.name}}</p>
        </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'
  export default{
    data(){
      return{
        list: []
      }
    },
    created: function(){
      axios.get('/api/active_test')
      .then(res => {
        this.list = res.data.tests
      });
    }
  }
</script>