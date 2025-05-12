class PolynomialTerm {
  int coefficient;
  int exponent;

  PolynomialTerm(this.coefficient, this.exponent);
}

class Polynomial {
  List<PolynomialTerm> terms = [];

  void addTerm(int coefficient, int exponent) {
    terms.add(PolynomialTerm(coefficient, exponent));
  }

  Polynomial add(Polynomial other) {
    Polynomial result = Polynomial();
    int i = 0, j = 0;
    while (i < terms.length && j < other.terms.length) {
      PolynomialTerm term1 = terms[i];
      PolynomialTerm term2 = other.terms[j];
      if (term1.exponent > term2.exponent) {
        result.addTerm(term1.coefficient, term1.exponent);
        i++;
      } else if (term1.exponent < term2.exponent) {
        result.addTerm(term2.coefficient, term2.exponent);
        j++;
      } else {
        int sum = term1.coefficient + term2.coefficient;
        if (sum != 0) {
          result.addTerm(sum, term1.exponent);  
        }
        i++;
        j++;
      }
    }
    while (i < terms.length) {
      result.addTerm(terms[i].coefficient, terms[i].exponent);
      i++;
    }
    while (j < other.terms.length) {
      result.addTerm(other.terms[j].coefficient, other.terms[j].exponent);
      j++;
    }
    return result;
  }

  Polynomial subtract(Polynomial other) {
    Polynomial result = Polynomial();
    int i = 0, j = 0;
    while (i < terms.length && j < other.terms.length) {
      PolynomialTerm term1 = terms[i];
      PolynomialTerm term2 = other.terms[j];
      if (term1.exponent > term2.exponent) {
        result.addTerm(term1.coefficient, term1.exponent);
        i++;
      } else if (term1.exponent < term2.exponent) {
        result.addTerm(-term2.coefficient, term2.exponent);
        j++;
      } else {
        int diff = term1.coefficient - term2.coefficient;
        if (diff != 0) {
          result.addTerm(diff, term1.exponent);
        }
        i++;
        j++;
      }
    }
    while (i < terms.length) {
      result.addTerm(terms[i].coefficient, terms[i].exponent);
      i++;
    }
    while (j < other.terms.length) {
      result.addTerm(-other.terms[j].coefficient, other.terms[j].exponent);
      j++;
    }
    return result;
  }

  void simplify() {
    terms.removeWhere((term) => term.coefficient == 0);
  }

  @override
  String toString() {
    String result = '';
    for (int i = 0; i < terms.length; i++) {
      PolynomialTerm term = terms[i];
      if (term.coefficient > 0 && i > 0) {
        result += '+';
      }
      result += '${term.coefficient}x^${term.exponent}';
    }
    return result;
  }
}
void main() {
  Polynomial p1 = Polynomial();
  p1.addTerm(6, 8);
  p1.addTerm(8, 7);
  p1.addTerm(5, 5);
  p1.addTerm(1, 3);
  p1.addTerm(15, 0);
  Polynomial p2 = Polynomial();
  p2.addTerm(3, 9);
  p2.addTerm(4, 7);
  p2.addTerm(3, 4);
  p2.addTerm(2, 3);
  p2.addTerm(2, 2);
  p2.addTerm(10, 0);
  Polynomial sum = p1.add(p2);
  Polynomial difference = p1.subtract(p2);
  sum.simplify();
  difference.simplify();
  print('P1 + P2 = $sum');
  print('P1 - P2 = $difference');
}