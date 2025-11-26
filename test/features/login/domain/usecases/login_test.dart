import 'package:dartz/dartz.dart';
import 'package:doux_sejour/features/login/domain/usecases/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'mocks/repository.mocks.dart';

void main() {
  late MockUserRepository mockedRepository;
  late Login usecase;

  group("Should test login usecase", () {
    setUp(() {
      mockedRepository = MockUserRepository();
      usecase = Login(mockedRepository);
    });

    test("User should be connected when password and email is valid", () async {
      //GIVEN
      final bool expectedResult = true;
      final String email = "Michu@gmail.com";
      final String password = "123456";
      when(
        mockedRepository.connexion(email, password),
      ).thenAnswer((_) async => Right(expectedResult));
      // WHEN
      final result = await usecase(Params(email: email, password: password));
      // THEN
      expect(result, Right(expectedResult));
      verify(mockedRepository.connexion(email, password));
      verifyNoMoreInteractions(mockedRepository);
    });

    test(
      "User should be connected when password and email is invalid",
      () async {
        //GIVEN
        final bool expectedResult = false;
        final String email = "Michu@gmail.com";
        final String password = "12345690";
        when(
          mockedRepository.connexion(email, password),
        ).thenAnswer((_) async => Right(expectedResult));
        // WHEN
        final result = await usecase(Params(email: email, password: password));
        // THEN
        expect(result, Right(expectedResult));
        verify(mockedRepository.connexion(email, password));
        verifyNoMoreInteractions(mockedRepository);
      },
    );
  });
}
