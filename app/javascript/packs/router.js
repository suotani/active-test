import Vue from 'vue'
import VueRouter from 'vue-router'
import Top from './components/index.vue'
import New from './components/new.vue'
import Add from './components/add.vue'
import Show from './components/show.vue'
import Question from './components/question.vue'

Vue.use(VueRouter)

const router = new VueRouter({
    routes: [
        {path: '/', component: Top, name: "top"},
        {path: '/new', component: New, name: "new"},
        {path: '/add', component: Add, name: "add"},
        {path: '/show', component: Show, name: "show"},
        {path: '/question', component: Question, name: "question"}
    ]
})

export default router