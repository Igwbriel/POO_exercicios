void main(){
    Produto Ps4 = new Produto(2729.00,"Playstation 4",DateTime.now());
    Produto TV_fullHD = new Produto(1999.00,"Smart TV led fullHD",DateTime.now());
    
    Item lote_ps4 = new Item(3, Ps4);
    Item lote_TV = new Item(7, TV_fullHD);


    Venda venda = new Venda(DateTime.now());
    venda.addItem(lote_TV);
    venda.addItem(lote_ps4);
    print(venda);
}

class Venda{
    final DateTime data;
    
    List<Item> itens = [];

    double total(){
        return itens.fold(0,(soma,elemento) => soma + elemento.total());
    }

    Venda(this.data);
    
    void setItem(double quantidade, Produto produto){
        Item item = Item( quantidade,  produto);
        itens.add(item);
    }

    void addItem(Item item){
        itens.add(item);
    }

    @override
    String toString() => " \n Estoque: \n${this.itens}\n \n Valor de estoque: RS${this.total()} reais";
}

class Item{
    final double quantidade;
    Produto prod;

    double total(){
        return quantidade * prod.valor;
    }

    Item(this.quantidade, this.prod);

    @override
    String toString() => "${this.prod} \n Quantidade: ${this.quantidade}  \n Preço total: RS${this.total()} reais \n -____________________________-";
}

class Produto{
    final double valor;
    final String descricao;
    final DateTime data;


    Produto(this.valor, this.descricao, this.data);

    @override
    String toString() => "\n Produto: ${this.descricao} \n valor: RS${this.valor} reais \n Data: ${this.data.day}/${this.data.month} \n Hora: ${this.data.hour}:${this.data.minute}  ";
} 