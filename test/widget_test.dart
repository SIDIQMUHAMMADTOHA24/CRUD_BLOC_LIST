import 'package:rombak_files/models/models.dart';

void main() {
  var model1 = UserModel(id: 1, name: 'toha', descriptions: 'tes');
  var model2 = UserModel(id: 1, name: 'toha', descriptions: 'tes');

  print(model1 == model2);
}
