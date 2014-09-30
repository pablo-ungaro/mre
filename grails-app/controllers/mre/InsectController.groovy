package mre

import grails.transaction.Transactional

@Transactional(readOnly = true)
class InsectController {

    def search(Integer max){
        params.max = Math.min(max ?: 10, 100)
        def order = params.order
        def family = params.family
        def subfamily = params.subfamily
        def result = [:]

        result << [q:params.q]
        result << [orders:Inseto.list().orderInsect.unique().sort()]

        if(order) {
            result << [order:order]
            result << [families:Inseto.where{orderInsect == order}.list().family.unique().sort()]

            if(family) {
                result << [family:family]
                result << [subfamilies: Inseto.where{family == family}.list().subfamily.unique().sort()]
            }

            if(subfamily) result << [subfamily:subfamily]
        }

        def insects = Inseto.where{
            if(params.q) {
                orderInsect =~ "%$params.q%" ||
                family =~ "%$params.q%" ||
                subfamily =~ "%$params.q%" ||
                species =~ "%$params.q%"
            }
            if(params.order) orderInsect =~ "%$params.order%"
            if(params.family) family =~ "%$params.family%"
            if(params.subfamily) subfamily =~ "%$params.subfamily%"
        }.list(offset: params.offset?:0,max: params.max,sort: 'species')

        result << [insectInstanceCount:Inseto.count()]
        result << [insects:insects]

        return result
    }

    def show( Inseto insect ){
        [insect:insect]
    }
}
