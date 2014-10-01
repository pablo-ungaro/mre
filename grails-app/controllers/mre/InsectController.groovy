package mre

import grails.transaction.Transactional

@Transactional(readOnly = true)
class InsectController {

    def search(Integer max){
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

        result << [insectInstanceCount:countByFilter(params)]
        result << [insects:listByFilter(params)]

        return result
    }

    def result(){
        redirect action: 'search', params: params
    }

    def show( Inseto insect ){
        [insect:insect]
    }


    private listByFilter( parameters, boolean count = false ) {

        def insects = Inseto.createCriteria().list( createCriteriaByFilter( parameters, count ) )

        return insects
    }

    private countByFilter( parameters ) {
        return listByFilter( parameters, true ).first()
    }

    private createCriteriaByFilter( parameters, boolean count ) {
        return {
            or {
                if (parameters?.q) {
                    ilike("orderInsect", "%${parameters?.q}%")
                    ilike("family", "%${parameters?.q}%")
                    ilike("subfamily", "%${parameters?.q}%")
                }
            }

            if (parameters?.order) {
                ilike("orderInsect", "%${parameters?.order}%")
            }

            if (parameters?.family) {
                ilike("family", "%${parameters.family}%")
            }

            if (parameters?.subfamily) {
                ilike("subfamily", "%${parameters.subfamily}%")
            }

            order("species", "asc")

            if (count) {
                projections {
                    rowCount()
                }
            }else{
                maxResults((parameters.max?:10) as int)
                firstResult((parameters.offset?:0) as int)
            }
        }
    }

}
