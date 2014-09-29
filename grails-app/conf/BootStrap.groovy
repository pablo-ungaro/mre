import mre.*

class BootStrap {

    def init = { servletContext ->
        /*Inseto.list().each {
            def i, o, f, sf
            if(it.species)i = Insect.findOrSaveWhere(name: it.species)
            if (it.subfamily) {
                sf = SubFamily.findOrSaveWhere(name: it.subfamily)
                if(it.species){
                    sf.addToInsects(i)
                    sf.save()
                }
            }
            if (it.family) {
                f = Family.findOrSaveWhere(name: it.family)
                if (it.subfamily) {
                    f.addToSubFamilies(sf)
                    f.save()
                }
            }
            if (it.orderInsect) {
                o = OrderInsect.findOrSaveWhere(name: it.orderInsect)
                if(it.family) {
                    o.addToFamilies(f)
                    o.save()
                }
            }
        }*/
    }

    def destroy = {
    }
}
