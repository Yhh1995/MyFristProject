from django.db import models


class BookInfoManger(models.Manager):
    def get_queryset(self):
        return super(BookInfoManger, self).get_queryset().filter(isDelete=False)

    def create(self, btitle, bpub_date):
        b = BookInfo()
        b.btitle = btitle
        b.bpub_date = bpub_date
        b.bread = 0
        b.bcommet = 0
        b.isDelete = False
        return b


class BookInfo(models.Model):
    btitle = models.CharField(max_length=20)
    bpub_date = models.DateTimeField(db_column='pub_date')
    bread = models.IntegerField(default=0)
    bcommet = models.IntegerField(null=False)
    isDelete = models.BooleanField(default=False)
    #
    # @classmethod
    # def create(cls, btitle, bpub_date):
    #     b = BookInfo()
    #     b.btitle = btitle
    #     b.bpub_date = bpub_date
    #     b.bread = 0
    #     b.bcommet = 0
    #     b.isDelete = False
    #     return b

    class Meta:
        db_table = 'bookinfo'
    books1 = models.Manager()
    books2 = BookInfoManger()


class HeroInfo(models.Model):
    hname = models.CharField(max_length=10)
    hgender = models.BooleanField(default=True)
    hcontent = models.CharField(max_length=1000)
    isdelete = models.BooleanField(default=False)
    book = models.ForeignKey(BookInfo)
