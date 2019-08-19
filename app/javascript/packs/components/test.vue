<template>
  <div>
    <p><router-link :to="{name: 'top'}">一覧に戻る</router-link></p>
    <h2>テスト<span>({{count}})</span></h2>
    <div class="form-wrap">
        <p class="status">{{question.text}}</p>
        <p><button type="button" v-on:click="showAnswer = true">答えを表示</button></p>
        <div v-if="showAnswer">
          <p>{{question.answer}}</p>
        </div>
        <button type="button" v-on:click="nextQuestion">次の問題</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
  export default{
    data(){
      return{
        questions: [],
        question: {},
        id: "",
        showAnswer: false,
        index: 0,
        count: 0
      }
    },
    created: function(){
        this.test_ids = this.$route.params.test_ids
        axios.get("/api/test/", {params: {test_ids: this.test_ids}})
        .then(res =>{
            this.questions = res.data.questions
            this.question = this.questions[this.index]
            this.count = res.data.count
        })
        .catch(er=>{
            this.status = "fail"
        })
    },
    methods: {
        nextQuestion: function(){
            this.index = this.index + 1
            this.showAnswer = false
            if(this.questions.length == this.index){
                this.index = 0
            }
            this.question = this.questions[this.index]
        }
    }
  }
</script>

<style scoped>
  h2 span{
    font-size: 15px;
    font-weight: 100;
  }
</style>