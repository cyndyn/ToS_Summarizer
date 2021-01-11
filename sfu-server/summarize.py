import sys
import warnings
warnings.filterwarnings("ignore", category=UserWarning)

from summarizer import Summarizer
from utility import prep_incoming

if __name__ == "__main__":
    # text = open(sys.argv[1], 'r').read()
    text = sys.stdin.read()
    parsed_data = prep_incoming(text, sys.argv[1].upper())

    model = Summarizer()
    result = model(parsed_data, min_length=30)
    summary = ''.join(result)

    print(summary)
