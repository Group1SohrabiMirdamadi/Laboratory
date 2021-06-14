class Train:
    def __init__(self, **kwargs):
        self.kwargs = kwargs
        print(self.kwargs)


t = Train(sasan='sasan', cat=12)

