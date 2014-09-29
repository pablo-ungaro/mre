package mre

class Inseto {
    String orderInsect
    String superfamily
    String family
    String subfamily
    String genus
    String species
    String author
    String distribution
    String notes

    static constraints = {
         orderInsect nullable: true
         superfamily nullable: true
         family nullable: true
         subfamily nullable: true
         genus nullable: true
         species nullable: true
         author nullable: true
         distribution nullable: true
         notes nullable: true
         version nullable: true
    }
}
