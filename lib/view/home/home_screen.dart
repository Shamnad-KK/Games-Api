import 'package:flutter/material.dart';
import 'package:games_api/controller/api_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiController = Provider.of<ApiController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      apiController.getStudentList();
    });
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://ak.picdn.net/shutterstock/videos/1014918493/thumb/10.jpg?ip=x480",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Consumer<ApiController>(
          builder: (BuildContext context, value, Widget? child) {
            return value.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                : ListWheelScrollView(
                    itemExtent: 220,
                    diameterRatio: 3,
                    children: List.generate(
                      value.gameList!.length,
                      (index) {
                        final game = value.gameList![index];
                        return Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(game.image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(194, 255, 255, 255),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: FittedBox(
                                      child: Column(
                                        children: [
                                          Text(
                                            game.title,
                                            maxLines: 3,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    subtitle: Text(
                                      game.platform,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }
}
