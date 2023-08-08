import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true; //cuando creamos la pagina, esta montado el widget

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        //load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false; //marcamos como desmontado el widget
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;
    

    if (!isMounted)
      return; //si no esta montado no lo refrescamos, lo hacemos asi, porque estamos en una funcion asincrona
    //si nos salimos de la pagina y regresamos y esta la funcion asincrona ejecutandose no puede refrescar el control
    //porque esta destruido
    setState(() {});

    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
    
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    // imagesIds.add(lastId + 1);
    // imagesIds.add(lastId + 2);
    // imagesIds.add(lastId + 3);
    // imagesIds.add(lastId + 4);
    // imagesIds.add(lastId + 5);

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10, //esto para separarlo de la isla dinamica
          strokeWidth: 2, //para hacer delgado el circular progress
          child: ListView.builder(
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        // child: const Icon(Icons.arrow_back_ios_new_sharp),
        child: (!isLoading)
            ? FadeIn(
                child: const Icon(Icons
                    .arrow_back_ios_new_sharp)) //con el fade in, no aparace de golpe el boton cuando se termina de cargar
            : SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded)),
      ),
    );
  }
}
