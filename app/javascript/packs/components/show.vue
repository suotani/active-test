<template>
  <div>
    <p><router-link :to="{name: 'top'}">一覧に戻る</router-link></p>
    <h2>{{test_name}}</h2>
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
        test_name: "",
        index: 0
      }
    },
    created: function(){
        this.id = this.$route.params.id
        this.test_name = this.$route.params.name
        axios.get("/api/active_test/" + this.id)
        .then(res =>{
            this.questions = res.data.questions
            this.question = this.questions[this.index]
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